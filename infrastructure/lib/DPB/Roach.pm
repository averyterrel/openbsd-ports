# ex:ts=8 sw=4:
# $OpenBSD: Roach.pm,v 1.5 2023/05/06 05:20:31 espie Exp $
#
# Copyright (c) 2019 Marc Espie <espie@openbsd.org>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
use v5.36;

# this code is nowhere near finished, it's just glue to try and integrate
# roach
package DPB::Roach;
# handles roach information, if required

sub new($class, $engine, $logger, $state)
{
	my $o = bless {
	    paths => {},
	    engine => $engine, 
	    logger => $logger, 
	    state => $state
	    }, $class;
	return $o;
}

sub factoryclass($)
{
	return "DPB::RoachInfo";
}

sub build1info($self, $v)
{
	my $f = $self->factoryclass;
	if (exists $self->{paths}{$v->pkgpath}) {
		$f->forget_roachinfo($v);
	} else {
		my $r = $f->new($v);
		$self->{paths}{$v->pkgpath} = $r;
		$self->{engine}->new_roach($r);
	}
}

package DPB::RoachInfo;

sub roachinfo($)
{
	return (qw(HOMEPAGE PORTROACH PORTROACH_COMMENT MAINTAINER));
}

sub new($class, $v)
{
	my $o = bless {pkgpath => $v->pkgpath}, $class;
	for my $d ($class->roachinfo) {
		if (defined $v->{info}{$d}) {
			$o->{$d} = $v->{info}{$d};
		}
	}
	# XXX need a copy because it will be destroyed by FETCH
	# TODO we can actually single out the first distfile!
	if (defined $v->{info}{DIST}) {
		my %h = %{$v->{info}{DIST}};
		$o->{DIST} = \%h;
	}
	$class->forget_roachinfo($v);
	return $o;
}

sub forget_roachinfo($class, $v0
{
	for my $d ($class->roachinfo) {
		delete $v->{info}{$d};
	}
}

1;
